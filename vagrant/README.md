# Installing the requirements

## RVM, because ruby coders are cowboys

https://rvm.io/rvm/install/

    curl -L https://get.rvm.io | bash -s stable --ruby
    source ~/.rvm/scripts/rvm

Please be aware that rvm will append itself to your PATH.

## veewee, to build local test boxes for vagrant

https://github.com/jedi4ever/veewee/blob/master/doc/installation.md

I've added the snapshot of veewee I've used as submodule at vagrant/veewee.

    sudo aptitude install libxslt-dev libxml2-dev
    cd vagrant/veewee
    # press y, to accept veewee's settings

Follow instructions until veewee is actually installed and working.

## building your baseboxes

    vagrant basebox define 'Debian-7.0.0-amd64' 'Debian-7.0-b4-amd64-netboot'
    vagrant basebox build 'Debian-7.0.0-amd64'
    
Now you have a virtual box with wheezy running. You can login either with
vagrant:vagrant or using vagrant's low-security ssh key to connect as root.
Let's check whether everything installed fine.

    vagrant basebox validate 'Debian-7.0.0-amd64'

Now package up the box as basebox, which we can use for our work.

    vagrant basebox export 'Debian-7.0.0-amd64'

Copy the 'Debian-7.0.0-amd64.box' file to some permanent storage.
Then, import it from there into vagrant proper.

Note: seemingly, the vagrant bundle only wants to tun from within the vagrant/
directory, so as soon as you're done building boxes with veewee, you'll want to
undo rvm's changes to your PATH and unalias vagrant.

    vagrant box add 'Debian-7.0.0-amd64' 'Debian-7.0.0-amd64.box'


