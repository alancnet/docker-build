# docker-build

Builds a series of Dockerfiles (named '<*imagename*>.dockerfile') in order to maintain dependencies.

Example:

**bar.dockerfile**:
```
FROM foo
RUN echo world!>>log
```

**dat.dockerfile**
```
FROM diz
RUN echo Dat!>>log
```

**diz.dockerfile**:
```
FROM foo
RUN echo Diz>>log
```

**foo.dockerfile**:
```
FROM ubuntu:trusty
RUN echo Hello>>log
CMD cat log
```

Running `docker-build` will build these images in the following order
1. foo.dockerfile
2. bar.dockerfile
3. diz.dockerfile
4. dat.dockerfile

Then...

```
> docker run --rm dat
Hello
Diz
Dat
```

```
> docker run --rm bar
Hello
world!
```
