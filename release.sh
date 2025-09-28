#!/bin/bash

# Release helper script for test project
# This script helps create and push git tags for releases

set -e

VERSION=$(cat VERSION)
echo "Current version: $VERSION"

# Check if tag already exists
if git tag -l | grep -q "v$VERSION"; then
    echo "Tag v$VERSION already exists locally"
else
    echo "Creating tag v$VERSION..."
    git tag -a "v$VERSION" -m "Release version $VERSION"
    echo "Tag v$VERSION created successfully"
fi

echo ""
echo "To complete the release:"
echo "1. Push the tag: git push origin v$VERSION"
echo "2. Create GitHub release from the web interface using v$VERSION tag"
echo "3. Use the release notes from CHANGELOG.md"
echo ""
echo "Release preparation complete!"