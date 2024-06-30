project_id = attribute("project_id")
vpc_name = attribute("vpc_name")

control "default" do
  impact 1.0
  title "Google Cloud VPC Network existence check"
  desc "Ensures the GCP VPC network is getting created and have a description as well."

  describe google_compute_network(project: project_id, name: vpc_name) do
    it { should exist }
    its('description') { should_not be_empty }
  end

  describe google_compute_network(project: project_id, name: vpc_name) do
    its('auto_create_subnetworks') { should be false }
  end
end

control "creation_time" do
  impact 1.0
  title "Google Cloud VPC Network creation time check"
  desc "Ensures the GCP VPC network is getting created."

  describe google_compute_network(project: project_id, name: vpc_name) do
    its('creation_timestamp_date') { should be > Time.now - 365*60*60*24*10 }
  end
end
