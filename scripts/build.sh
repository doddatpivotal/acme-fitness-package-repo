#!/bin/bash -e

# Handle acme-fitness Package
kbld -f packages/acme-fitness/1.0.0/bundle/config --imgpkg-lock-output packages/acme-fitness/1.0.0/bundle/.imgpkg/images.yml
# Generate package file from from template
ytt -f packages/acme-fitness/1.0.0/package-template.yaml \
    --data-value-file openapi=<(ytt -f packages/acme-fitness/1.0.0/bundle/config/values-schema.yaml --data-values-schema-inspect -o openapi-v3) \
    -v version="1.0.0" > package-repo/packages/acme-fitness.external.demo-dependencies.learn/1.0.0.yaml

kbld -f packages/acme-fitness/1.0.1/bundle/config --imgpkg-lock-output packages/acme-fitness/1.0.1/bundle/.imgpkg/images.yml
# Generate package file from from template
ytt -f packages/acme-fitness/1.0.1/package-template.yaml \
    --data-value-file openapi=<(ytt -f packages/acme-fitness/1.0.1/bundle/config/values-schema.yaml --data-values-schema-inspect -o openapi-v3) \
    -v version="1.0.1" > package-repo/packages/acme-fitness.external.demo-dependencies.learn/1.0.1.yaml

kbld -f packages/acme-fitness/1.0.2/bundle/config --imgpkg-lock-output packages/acme-fitness/1.0.2/bundle/.imgpkg/images.yml
# Generate package file from from template
ytt -f packages/acme-fitness/1.0.2/package-template.yaml \
    --data-value-file openapi=<(ytt -f packages/acme-fitness/1.0.2/bundle/config/values-schema.yaml --data-values-schema-inspect -o openapi-v3) \
    -v version="1.0.2" > package-repo/packages/acme-fitness.external.demo-dependencies.learn/1.0.2.yaml

kbld -f packages/acme-fitness/1.0.3/bundle/config --imgpkg-lock-output packages/acme-fitness/1.0.3/bundle/.imgpkg/images.yml
# Generate package file from from template
ytt -f packages/acme-fitness/1.0.3/package-template.yaml \
    --data-value-file openapi=<(ytt -f packages/acme-fitness/1.0.3/bundle/config/values-schema.yaml --data-values-schema-inspect -o openapi-v3) \
    -v version="1.0.3" > package-repo/packages/acme-fitness.external.demo-dependencies.learn/1.0.3.yaml

# Copy over metada file
cp packages/acme-fitness/metadata.yaml package-repo/packages/acme-fitness.external.demo-dependencies.learn/

# Package Repo imagelock file
kbld -f package-repo/packages/ --imgpkg-lock-output package-repo/.imgpkg/images.yaml
