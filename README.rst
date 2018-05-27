##############################
Test HTTPS in Docker and Flask
##############################

This is an example repository demonstrating how one might achieve HTTPS in a
local development environment with Flask and uWSGI. It contains the following
steps:

1. Steps to self-sign your own SSL certificates
2. All the code necessary to deploy your own basic codebase

System dependencies
===================

AFAIK, you'll need the following system dependencies to run:

.. code:: sh

   # Ubuntu
   sudo apt install openssl
   # Follow instructions here to install docker
   # https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce

Run instructions
================

Once you've installed all system dependencies, simply type "make" from the
command line. When it's done building, navigate to "https://localhost:8443" to
see "hello", and "https://localhost:8443/world" to see "hello, world". Assuming
you're using Firefox, you'll need to add an exception in your browser in order
for Firefox to accept your self-signed certificate.

Notes
=====

By typing make, you will create three files in your instance folder. These are
used, in combination, to generate your SSL certificate with which your
communication with your local web server is encrypted. The system creates a
Docker image tagged as "test-https:base".

Author
======

Samuel Roeca
