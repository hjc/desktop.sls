devutils:
  vagrant:
    ##
    # This determines the default provider for vagrant, which merely determines
    # which packages we will preinstall to ensure vagrant works. 
    #
    # :values: virtualbox|vmware
    # :type: string
    ##
    provider: virtualbox

    ##
    # If you want multiple providers to work, you can use this variable to list
    # them. It should be a list of valid vagrant providers.
    #
    # :values: virtualbox|vmware
    # :type: list[string]
    # :example: alternative-providers: ['vmware']
    ##
    alternative-providers: []

  ##
  # Which JDK should be installed and used by default for various dev apps that
  # require a JDK (think IntelliJ or Elasticsearch).
  #
  # This variable's value is used in roots/devutils/java/determine-default.sls
  # and that file should be included as is anywhere you want to require a JDK
  # to be installed, it will handle logic for you.
  #
  # :values: oracle|open-jdk
  # :type: string
  ##
  default-jdk: oracle