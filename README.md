# AOSP Build Docker image

Stolen from [aosp/build/make/tools/docker/](https://android.googlesource.com/platform/build/+/refs/heads/main/tools/docker/)
but `repo` is not included in the container, so you're supposed to run `repo init` and `repo sync` from the host.

## Build it

```sh
podman build -t aosp-builder .
```

## Run it

```sh
podman run -it --rm -v $HOME/projects/aosp:/aosp -v $HOME/.cache/ccache:/ccache aosp-builder bash
```

## Test it

```sh
source build/envsetup.sh
lunch aosp_cf_x86_64_only_phone-aosp_current-userdebug
```
