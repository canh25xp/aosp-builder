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

> [!NOTE]
> If you use `docker`, you should run it with your host user permissions

```sh
podman run -it --rm --user $(id -u):$(id -g) -v $HOME/projects/aosp:/aosp -v $HOME/.cache/ccache:/ccache aosp-builder bash
```

## Test it

```sh
source build/envsetup.sh
lunch aosp_cf_x86_64_only_phone-aosp_current-userdebug
m -j16 wpa_supplicant # First build
aninja wpa_supplicant # Incremental build
file out/target/product/vsoc_x86_64_only/vendor/bin/hw/wpa_supplicant
```

References

- [Android 15 (AOSP) Build with Podman on Ubuntu 24.04](https://www.maksonlee.com/android-15-aosp-build-with-podman-on-ubuntu-24-04/)
- [Build Android 15 AOSP with Docker on Ubuntu 24.04](https://www.maksonlee.com/build-android-15-aosp-with-docker-on-ubuntu-24-04/)
- [Build Android](https://source.android.com/docs/setup/build)
- [Download the Android source](https://source.android.com/docs/setup/download)
