# AOSP Build Docker image

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
