# k8s-Manifestation

```yaml
uses: namgaytobden/k8s-Manifestation-Beta@main
with:
  manifest_path: deployment/manifest/
  id: image | Deployment 
  block: spec.template.spec.containers.[0].image. | spec.template.spec.imagePullSecrets[0].
  value: docker_repo:tag | regred
```