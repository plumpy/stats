protobuilder:
	docker build -q -t stats-protobuilder:latest build/protoc/

proto_command = docker run \
  --rm \
  --mount type=bind,source=$(abspath proto/stats),target=/mnt/output/go \
  stats-protobuilder:latest

proto: protobuilder
	$(proto_command) update

checkproto: protobuilder
	$(proto_command) check
