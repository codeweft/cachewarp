#[CacheWarp](http://www.cachewarp.com/)

Gem targeted towards providing a solution to verify cache headers for content delivery services like Akamai by:

[@bitweft](http://www.bitweft.com/) [@codeweft](http://www.codeweft.com/)

##Usage

###Using Ruby Code

Using CacheWarp object:

```
# Require CacheWarp in your file
    require 'cachewarp'

# Initialize Request Object
    request = CacheWarp.new('http://www.akamai.com/')

# Fetch Request
    request.fetch

# Get Response Headers
    request.response_headers

# Verify 'TCP HIT' i.e if Akamai is caching the request
    request.is_cached?    
```

One Liner:

```
# Returns 'false' since Google does not cache using Akamai CDN
    CacheWarp.new("http://www.google.com/").is_cached?  
```

###Console/CommandLine/Terminal/System Command

```
# Following is an example of non zero exit code. Run the following command on terminal
# Useful to verify caching post deployment using CI tools like Jenkins and GO
    $ cachewarp http://www.google.com/ --quiet
```



##Installation

Using Bundler

```
# Add to Gemfile
    gem "cachewarp", "~> 0.0.2" 
# Install Gem
    $ bundle
```

Using gem command

```
    $ gem install cachewarp
```

##Change Log:

0.0.2

    * Now you can directly perform 'CacheWarp.new('http://www.akamai.com/').is_cached?'

0.0.1

    * Provision to verify TCP HIT in Akamai cache

##Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

##Community

* [CacheWarp on RubyGems](https://rubygems.org/gems/cachewarp)
* [CacheWarp on RubyDoc](http://rubydoc.info/gems/cachewarp)

##Build Status:

[![Dependency Status](https://gemnasium.com/juteroot/cachewarp.png)](https://gemnasium.com/juteroot/cachewarp)
[![Code Climate](https://codeclimate.com/github/juteroot/cachewarp.png)](https://codeclimate.com/github/juteroot/cachewarp)
<!--
[![Build Status](https://drone.io/github.com/juteroot/cachewarp/status.png)](https://drone.io/github.com/juteroot/cachewarp/latest)
[![Codeship Status for juteroot/cachewarp](https://www.codeship.io/projects/bbb2cd50-ba46-0130-e2db-6abb3b84c73c/status?branch=master)](https://www.codeship.io/projects/4384)
-->
