require 'json'

class ConfigProvider
    ##
    # Creates a ConfigProvider which helps in reading values from the bottle's config file
    # in the bottle-configs directory.
    # We are moving values to json file so that it is easy to modify them by bot

    CONFIG_DIR = File.join(File.dirname(__FILE__), "..", "bottle-configs")

    def initialize(name, config_file_path)
        if config_file_path
            file = File.read(config_file_path) 
        else 
            file = File.read(File.join(CONFIG_DIR, "#{name.downcase}.json"))
        end

        @config_data = JSON.parse(file)
    end

    def name
        @config_data['name']
    end

    def bin
        @config_data['bin']
    end

    def url
        @config_data['url']
    end

    def sha256
        @config_data['sha256']
    end

    def root_url
        @config_data['bottle']['root_url']
    end

    def sierra_hash
        @config_data['bottle']['sha256']['sierra']
    end

    def linux_hash
        @config_data['bottle']['sha256']['linux']
    end
end
