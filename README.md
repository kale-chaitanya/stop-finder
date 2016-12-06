# N stops from

Given a csv of the tube stations in London, this program answers the following question:
What stations have a minimum N stops from East Ham?  Prints out the results in alphabetical order.

For example, if N = 4, the results would be:
- Abbey Road (lines = District, Hammersmith and City, DLR, Jubilee)
- Bromley-by-Bow (lines = District, Hammersmith and City, DLR, Jubilee)
- Canning Town (lines = District, Hammersmith and City, DLR, Jubilee)
- Dagenham Heathway (lines = District, Hammersmith and City, Overground)
- Leytonstone High Road (lines = District, Hammersmith and City, Overground)
- Star Lane (lines = District, Hammersmith and City, DLR, Jubilee)
- Stratford (lines = District, Hammersmith and City, DLR, Jubilee, Central, Overground)


### Prerequisites

Homebrew. Refer to http://brew.sh/ for how to.


### Installing

There is a setup script that installs rbenv to set the correct ruby version and associated gems

`bin/setup`

If you prefer not to use rbenv

- Set the ruby version to 2.3.1
- `gem install bundler`
- `bundle install`

## Running the tests

Just run `rspec` from the project directory to run all the tests
