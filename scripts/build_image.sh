#!/usr/bin/env bash

source image_name_version.sh

echo "Checking if image $image_name exists on localhost"
image=$(docker images | grep $image_name | grep $image_version)

build_image() {
    echo "BUILDING THE IMAGE"
    docker build -t $image_name:$image_version ..
}

if [ "$image" ]
then
    echo "Image $image_name already exists"
    echo $image
    echo "Do you want to delete the image (y/N)?"
    while :
    do
        read del_image
        case $del_image in
            [yY])
                echo "Deleting Image $image_name"
                docker image rm $image_name:$image_version
                echo "Image deleted successfully"

                build_image
                break
                ;;
            [nN])
                echo "Skipping image deletion"
                # TODO -> ask if to update image version
                # update image version
                break
                ;;
            *)
                echo "Input does not match, please input either (y/N)"
                ;;
        esac
    done
else
    echo "Image does not exists"
    build_image
fi

echo "Done here!"