image:
	snapcraft-docker ubuntu-image --image-size 4G --extra-snaps samplekernel_*_amd64.snap model

run:
	kvm -m 1500 -nographic -redir tcp:10022::22 -redir tcp:14200::4200 pc.img

model-asseration:
	cat model.json | snap sign -k default > model

clean:
	$(RM) -v pc.img samplekernel*snap
