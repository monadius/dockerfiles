## Useful Docker commands

- Build

```
docker build -f {Docker file} -t {tag} .
```

- Run interactive

```
docker run --rm -it {image}
```

- List all images

```
docker images -a
```

- Delete an image

```
docker rmi {image tag or id}
```

- Delete all unused images

```
docker images prune
```

- Delete all untagged images and containers

```
docker system prune
```

- Delete everything

```
docker system prune -a
```
