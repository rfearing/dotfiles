## SSH

To not have to type your password each time you connect to a server, authenticate using [PKI][pki]. Genereate keys using the `ssh-keygen` command:

    $ ssh-keygen -t rsa -b 4096

Typically, use the defaults as they work well with a majority of use cases.

## Using an SSH config file / Creating Identity Files

By creating a local configuration file for SSH, you can create shortcuts for servers you frequently access and define more advanced options. Additionally, by creating identity files, you can revoke or update a key for a specific server without having to edit the key everywhere else.

If you haven’t done so yet, create a config file:

    $ touch ~/.ssh/config

To add a host, add the required parameters you’d need to SSH into the server, like `User`, `HostName`, and optionally `IdentityFile`.

    Host example_server
         User sparkler
         HostName 23.222.222.2
         IdentityFile ~/.ssh/example/id_rsa

The `IdentityFile` option above is simply another generated private key, just like our `~/.ssh/id_rsa` key. To generate this key in this example, we would have run the following command:

    $ ssh-keygen -f ~/example/id_rsa -t rsa -b 4096

The `-f` flag specifies the file location. For help with other options, visit this resource on [generating a new SSH key][keygen].

After saving, you can open a new SSH session to this server by running this command:

    $ ssh example_server

You can append as many hosts as you need to your config file.

## Debugging SSH

Sometimes we run into issues trying to SSH into a server. Do we have the wrong username? Did we incorrectly store our HostName? Running SSH commands in verbose mode can help us debug our ssh connection.

Verbose mode causes ssh to print debugging messages about its progress. It is run by adding the `-v` flag. Multiple v’s increase the verbosity of the messages (with a maximum of three) e.g. `-v` vs `-vvv`.  Additionally, you can create a log file (instead of a standard error) with the `-E` flag followed by the name of the file you want to save. So an example of a verbose ssh connection with errors logged would be this:

    $ ssh example_server -vvv -E log_file

Run `man ssh` for additional parameters you can run with ssh.

*Note, the above is modified from the [Sparkbox Standard][sparkbox_original_post]*

[keygen]:https://www.ssh.com/ssh/keygen/
[pki]: http://www.techrepublic.com/article/a-beginners-guide-to-public-key-infrastructure/
[sparkbox_original_post]:https://github.com/sparkbox/standard/tree/main/software/ssh#using-an-ssh-config-file--creating-identity-files