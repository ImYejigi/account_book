
const labels = ['식비','교통비','패션/미용','기타'];

  const data = {
    labels: labels,
    datasets: [{
      label: 'My First dataset',
      backgroundColor: ['rgb(255, 99, 130)',
                      'rgb(220, 99, 130)',
                      'rgb(25, 99, 130)',
                      'rgb(2, 99, 30)',
                      'rgb(255, 99, 30)',],
      borderColor: 'rgb(255, 99, 132)',
      data: [1,2,3,4],
    }]
  };
  var ctx = document.getElementById("myChart").getContext('2d');
  
  const config = {
    type: 'pie',
    data: data,
    options: {}
  };

  const myChart = new Chart(
    document.getElementById("myChart"),
    config
  );