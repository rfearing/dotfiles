## Verified Commits
Verified commits are changes to a git repository that have been cryptographically signed by the committer. This should be done on any new machine. See Why [Verified Commits are so Important][why-verified-is-important]

**Generating Keys**

Generate signing keys using [GPG Keychain][gh-gpg] and a password manager to generate a strong passphrase.

**Adding Your Public Key to Github**

Once you have generated your keys copy the public key and add it to your [Github account keys][github-account-keys] just like you would a new SSH key.

**Adding Your Signing Key**

In the GPG Keychain app, highlight the line identifying your keys, and click `Details` at the top-right of the window.

Copy the `Key ID` near the middle of that new window to your clipboard and assign it to your global github user, replacing `keyid` with the value you copied from GPG Keychain:

    $ git config --global user.signingkey keyid

Then, run:

    $ git config --global commit.gpgsign true

Make a new commit and a window will popup asking you to enter your GPG passphrase. Before clicking `OK` check the box next to `Save in Keychain`. This will save your passphrase securely to your macOS profile and you will never need to enter your passphrase again.

**Expired Keys**

When a GPG key is created, an expiration date is set automatically. If you are still using the key on the date it expires, you will no longer have verified commit messages. You will need to either extend the date on your current key or generate a new key. GitHub will require you to re-add your expired key if you extend it, so it's recommended that you take this opportunity to generate a new key for added security. Also leave the expired key connected to your account (rather than deleting it) as the dates on the key will match older commits. You will have to update your local `.gitconfig` file(s) to utilize the new signing key. [Check out the Github documentation on expired keys for more information.][github-expired-gpg].

[why-verified-is-important]: https://github.com/sparkbox/standard/pull/64
[gpg-tools-website]: https://gpgtools.org/
[github-account-keys]: https://github.com/settings/keys
[github-expired-gpg]: https://docs.github.com/en/github/authenticating-to-github/updating-an-expired-gpg-key
[sb_post]:https://github.com/sparkbox/standard/blob/1ca790bf2e5d553264b5d746ab3a9c91a6ffb766/security/security_policy_compliance/verified-commits.md
[gh-gpg]:https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key
