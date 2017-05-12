This is a sample project help you build a Ubuntu Core image and test with virtual machine.
It's useful for developers who is working on new kernel tree for Ubuntu Core, you can verify the snapd functions using qemu.

The proejct use [snapcraft-docker](https://github.com/chihchun/snapcraft-docker), you should be able to build the final image on any Linux distro.

# Usage:

## build the kernel image
    $ git clone -b stable-4.9.y https://github.com/chihchun/sample-kernels.git
    $ sudo wget -o /usr/local/bin/snapcraft-docker https://raw.githubusercontent.com/chihchun/snapcraft-docker/master/snapcraft-docker
    $ sudo chmod 755 /usr/local/bin/snapcraft-docker
    $ cd sample-kernels && snapcraft-docker && cd ..

## Create the image, and run by qemu
    # Clone this project
    $ git clone https://github.com/chihchun/ubuntucore-sampleimage.git
    $ cp ./sample-kernels/samplekernel_*_amd64.snap  ./buntucore-sampleimage
    $ cd buntucore-sampleimage
    $ make image
    $ make run
    # launch kvm, please follow the instruction to register the device
    # after the device is registerd, you can ssh into the virtual machine with your ssh key.
    $ ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -v ${USER}@localhost -p 10022
    
# System requirements

    apt-get install qemu-kvm git make openssh-client docker.io

 * docker
 * ssh
 * git
 * gnu make
 * kvm/qemu
 
