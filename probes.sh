# Get all Liveness and Readiness probes of a cluster
# Need declare ns and cluster before run this script

list=( $( kubectl get deployment --no-headers -o custom-columns=":metadata.name" ) )
echo "Get probes..."
for i in "${list[@]}"; do (echo ---------------); echo "$i"; kubectl describe deployment "$i" | grep Liveness; kubectl describe deployment "$i" | grep Readiness; done >> probes.txt
echo "Ready!"