Barter
================

Barter is a ruby on rails application built to facilitate skill based bartering.  It features map based location filtering, devise with omniauth, and admin dashboard.

Barter is built in Rails 4 with postgresql 9.4 and includes seed data.

Demo
-------------------
A live demo version is available at [LINK](https://fast-taiga-6118.herokuapp.com/)

Contributors
-------------------
- [trodrigu](http://github.com/trodrigu)
- [therahl](http://github.com/therahl)
- [warrendevs](http://github.com/warrendevs)
- [smcfarlane](http://github.com/smcfarlane)

Prerequisites
-------------

- Rails 4
- Postgresql 9.4

Getting Started
---------------

The easiest way to get started is to clone the repository:

```bash
# Get the latest snapshot
git clone https://github.com/smcfarlane/Barter.git

cd Barter

# Install NPM dependencies
bundle install

# Create and migrate database
rake db:create
rake db:migrate

# Optional: Seed database
rake db:seed

# Run rails server
rails server
```


License
-------------------
The MIT License (MIT)

Copyright (c) 2015 Barter

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

