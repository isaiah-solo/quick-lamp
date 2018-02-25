# Quick Lamp Stack

Quickly set up a LAMP Stack for your application regardless of your environment.

The only dependencies needed are Vagrant and VirtualBox, which you can install using these links

* Vagrant: https://www.vagrantup.com/downloads.html
* VirtualBox: https://www.virtualbox.org/wiki/Downloads

After downloading and installing, within the quick-lamp directory, include your project in the **public**
directory and then run

    $ vagrant up

This will build the Vagrant box with the necessary LAMP packages included. You can directly access the
instance using

    $ vagrant ssh

The credentials/config for each service in the stack is

Apache
* IP: **127.0.0.1**
* Port: **8080**

MySQL
* Host: **127.0.0.1**
* Database: **mysql**
* User: **root**
* Password: **password**

Have fun!
