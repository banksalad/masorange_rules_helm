"""Rules for manipulation helm packages."""

load("//helm:helm-chart-package.bzl", _helm_chart = "helm_chart")
load("//helm:helm-push.bzl", _helm_push = "helm_push")
load("//helm:helm-release.bzl", _helm_release = "helm_release")

def helm_chart(name, image="", **kwargs):
    args = kwargs

    if image:
        args["image"] = image + ".digest"

    _helm_chart(
        name = name,
        **args,
    )


# Explicitly re-export the functions
# helm_chart = _helm_chart
helm_push = _helm_push
helm_release = _helm_release
