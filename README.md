# chtsh

Alternatively:

```sh
alias chtsh='curl -s cht.sh/$(curl -s cht.sh/:list | fzf) | less -R'
```

# RFC Lookup

```sh
# List rfc index
./rfc.sh list
```

```sh
# Read a rfc
./rfc.sh 791
```
