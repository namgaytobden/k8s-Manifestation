# k8s-Manifestation

```yaml
uses: namgaytobden/k8s-Manifestation-Beta@main
with:
  manifest_path: deployment/manifest/
  tag: image
  block: spec.template.spec.containers.[0].image.
  value: docker_repo:tag
```