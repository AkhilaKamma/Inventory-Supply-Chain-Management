from cassandra.cluster import Cluster

def create_cassandra_session():
    contact_points = ['cassandra-1', 'cassandra-2', 'cassandra-3']
    cluster = Cluster(contact_points)
    session = cluster.connect()
    return session
