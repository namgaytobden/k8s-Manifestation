# k8s-Manifestation

This action finds all **Kubernetes manifest** files containing `id` in their content, and for each file, it updates the `key` with `value`.
This is useful for automatically updating `key` references in your Kubernetes configuration during deployment or GitOps process.

- It takes in **4** inputs: *(**Required**)*
  - `manifest_path` k8s resource path t
  - `id` that uniquely identifies manifest 
  - `block` specific yaml block you want to modify
  - `value` modification value

#### Modifying Single Key

This action allows you to automate the process of updating specific YAML files with new `value` for specific `key` based on matching `id`.
- Make sure to use `id` to uniquely identify k8s manifests/resource files.

```yaml
uses: namgaytobden/k8s-Manifestation-Beta@main
with:
  manifest_path: deployment/manifest/
  id: image
  key: spec.template.spec.containers.[0].image.
  value: docker_repo:tag
```

#### Modifying Multiple Keys

- Uses line separator ' | '
- Make sure that the `ids`, `keys` and `value` placement corresponds with one another correctly according to what you want to modify.  
- You can modify as much keys as you want.

```yaml
uses: namgaytobden/k8s-Manifestation-Beta@main
with:
  manifest_path: deployment/manifest/
  id: image | Deployment 
  key: spec.template.spec.containers.[0].image. | spec.template.spec.imagePullSecrets[0].
  value: docker_repo:tag | regred
```
