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