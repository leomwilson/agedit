# agedit

A shell script to edit files encrypted with age

## Disclaimer

This shouldn't be used for anything important.
A couple basic security measures have been taken, but it would still be trivial
for another program with access to your files to gain access to the contents of
encrypted files while you're editing them.

Also, in the highly unlikely event of a filename collision the script will fail.
This will probably be fixed in the future.

This has only been tested on Arch Linux, but it should work on any system
that can run POSIX shell. PRs for better compatibility are welcome.

## Installation

### Manual

Install [age](https://github.com/FiloSottile/age) and OpenSSL.

Then, move `agedit.sh` to a directory in your `$PATH`, optionally removing the extension.

## Configuration

Agedit relies on two configuration files:

* `~/.config/agedit/identity.txt` - An identity file containing your Age private key
* `~/.config/agedit/recipients.txt` - A recipients file containing your Age public key

These must be in a format to be passed to `age -i` and `age -R`, respectively.
For more information, see [age's documentation](https://github.com/FiloSottile/age).

You can also change your editor by setting `$EDITOR`.

## Usage

`agedit` takes one argument, the name of the encrypted file to edit.

For example, if you had a file called `file.txt.age`,
you would call `agedit file.txt.age`. It's that simple!
Agedit will then open the decrypted `file.txt` in your `$EDITOR`.
