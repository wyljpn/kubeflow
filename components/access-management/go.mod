module github.com/kubeflow/kubeflow/components/access-management

go 1.12

require (
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/google/btree v1.0.0 // indirect
	github.com/gorilla/mux v1.7.2
	github.com/gregjones/httpcache v0.0.0-20190212212710-3befbb6ad0cc // indirect
	github.com/imdario/mergo v0.3.7 // indirect
	github.com/kubeflow/kubeflow/components/profile-controller v0.0.0-20191008230951-321c1d3313b6
	github.com/peterbourgon/diskv v2.0.1+incompatible // indirect
	github.com/prometheus/client_golang v1.11.1
	github.com/sirupsen/logrus v1.6.0
	golang.org/x/text v0.3.7 // indirect
	golang.org/x/time v0.0.0-20190308202827-9d24e82272b4 // indirect
	istio.io/api v0.0.0-20201125194658-3cee6a1d3ab4
	istio.io/client-go v1.8.0
	k8s.io/api v0.18.1
	k8s.io/apimachinery v0.18.1
	k8s.io/client-go v11.0.1-0.20190409021438-1a26190bd76a+incompatible
	sigs.k8s.io/controller-runtime v0.2.0
)

replace (
	git.apache.org/thrift.git => github.com/apache/thrift v0.0.0-20180902110319-2566ecd5d999
	k8s.io/api => k8s.io/api v0.0.0-20190528110122-9ad12a4af326
	k8s.io/apimachinery => k8s.io/apimachinery v0.0.0-20190221084156-01f179d85dbc
	k8s.io/client-go => k8s.io/client-go v0.0.0-20190528110200-4f3abb12cae2
)
