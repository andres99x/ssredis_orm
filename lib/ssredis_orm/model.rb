module SsredisOrm
  module Model

    def self.extended(base)
      base.class_eval do
        include InstanceMethods
      end
    end

    def field(*args)
      args.each do |arg|
        attr_accessor arg
        fields << arg
      end
    end

    def fields
      @fields ||= []
    end

    def create(options={})
      temp = self.new
      options.each_pair do |key, value|
        temp.send("#{key.to_s}=",value) if temp.respond_to? "#{key}="
      end
      return temp
    end

    def find(id)
      result = JSON.load($redis.get "#{self.name}:#{id}")
      return if result.nil?
      temp = self.new
      temp.id = id
      result.each_pair do |key, value|
        temp.send("#{key.to_s}=",JSON.load(value)) if temp.respond_to? "#{key}="
      end
      return temp
    end

    private

      module InstanceMethods
        require 'json'

        attr_accessor :id

        def fields
          self.class.fields
        end

        def save
          @id ||= $redis.incr "#{self.class.name}:autoincrement"
          $redis.set "#{self.class.name}:#{@id}", self.to_json
        end

        def delete
          $redis.del "#{self.class.name}:#{@id}" if @id
          @id = nil
        end

        def to_json
          hash = Hash.new { |hash, key| hash[key] = self.send(key).to_json unless self.send(key).nil?  }
          self.fields.each do |field|
            hash[field]
          end
          return hash.to_json
        end

      end

  end
end
