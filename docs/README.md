# Coisas que eu aprendi

## Ciclo de vida de nó(?)

`queue_free()` faz o nó sumir.

`get_tree().call_group("mobs", "queue_free")` chama a função `queue_free` em todo
 mob do grupo "mobs"


## Deploy

Itch.io:

https://bitbra.in/2020/08/01/publish-godot-game-to-itchio.html

HTML5:

https://github.com/bitbrain/corg-e/blob/main/.github/workflows/release-to-itchio.yml


## Servidor local com Python

Pra rodar um servidor com a build pra web

```
python3 -m http.server --directory builds/web/
```

