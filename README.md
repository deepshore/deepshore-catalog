# deepshore-catalog
Deepshore's Operators Catalog

## How to add an operator bundle to the catalog

1. Modify `catalog-template.yaml` according to your needs. See the [docs](https://olm.operatorframework.io/docs/tasks/creating-a-catalog/#organizing-the-bundles-into-channels).
2. Create a pull request.
3. After the merge GithubActions take care of the rest.

## How to make the catalog available

Make sure OLM was installed and create a `CatalogSource`. See the [docs](https://olm.operatorframework.io/docs/tasks/make-catalog-available-on-cluster/).

## How to install an operator from the catalog

Create a `Subscription`. See the [example](example/subscription.yaml).

## What else?

Create a `CustomResource` matching the installed operator.

## How to run the example

Run the example like this:
```bash
kubectl apply -k example
```