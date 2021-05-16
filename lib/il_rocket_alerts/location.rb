require 'json'
module IlRocketAlerts
  class Location
    
    @@language = :he
    attr_reader :id, :value, :area_id

    def self.all
      @results ||= JSON.load(File.read('./data/labels.json'))
      
      @_all ||= @results.values.collect do |location_attrs|
        self.new(location_attrs)
      end
      return @_all
    end

    def self.find(id)
      self.all.find { |location| location.id == id.to_s }
    end

    def self.find_by_area_id(area_id)
      self.all.find { |location| location.area_id == area_id.to_s }
    end

    def self.set_language(lang)
      @@language = lang.to_sym
    end

    def initialize(options = {})
      @name = {
        he: options["label_he"],
        en: options["label_en"],
        ru: options["label_ru"],
        ar: options["label_ar"],
      }

      @area_name = {
        he: options["areaname_he"],
        en: options["areaname_en"],
        ru: options["areaname_ru"],
        ar: options["areaname_ar"],
      }

      @id = options["id"]
      @area_id = options["areaid"]
      @value = options["value"]
    end

    def name
      @name[self.class.lang]
    end

    def area_name
      @area_name[self.class.lang]
    end

    def self.lang
      @@language
    end
  end
end