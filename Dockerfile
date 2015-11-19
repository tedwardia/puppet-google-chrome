FROM centos:latest

RUN yum install https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm -y && \
    yum install install git puppet -y && \
    git clone -b fedora https://github.com/jamesnetherton/puppet-google-chrome.git /etc/puppet/modules/google_chrome && \
    puppet module install puppetlabs-apt && \
    puppet module install darin/zypprepo && \
    puppet apply /etc/puppet/modules/google_chrome/integration-tests/chrome.pp

CMD [ "ls", "-l", "/usr/bin/google-chrome" ]
