dockerer
========

dockerer provides you with a CentOS VM environment with Chef/Docker/kitchen-docker enabled.
You can create an environment to run following tools on CentOS only executing `vagrant up`.

- Chef (toolkit from omnibus installer)
- Docker
- knife-solo
- test-kitchen
- kitchen-docker
- ServerSpec

How to use
==========

1. Install Vagrant

    `http://www.vagrantup.com/`

2. Execute following command inside your project directory for Chef (that you want to run test-kitchen with kitchen-docker).

    ```bash
    git clone https://github.com/ryotaro/dockerer.git
    cd dockerer
    vagrant up
    ```

3. Now, you can login to Vagrant's CentOS VM Environment that you can use above toolkit by following command.

    ```bash
    vagrant ssh
    ```

4. You can see a directory *develop* that is mounted directory to your Chef project directory.

5. Go into the *develop* directory and execute toolkits!

Contact
=======

Feel free to contact me via: ryo@longsleeper.com
(Both English and Japanese are OK)
