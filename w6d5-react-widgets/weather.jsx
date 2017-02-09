import React from 'react';
import ReactDOM from 'react-dom';

class Weather extends React.Component {
  constructor() {
    super();

    this.state = { weather: null, location: null };

  }

  componentDidMount() {
    this.state.location = navigator.geolocation;
    this.state.location.getCurrentPosition((pos)=>this.getWeather(pos));
  }

  getWeather(pos) {
    const lat = pos.coords.latitude;
    const lon = pos.coords.longitude;
    const xhr = new XMLHttpRequest();
    let that = this;
    xhr.onreadystatechange = function() {
      if (xhr.status == 200) {
        that.setState({weather: xhr.responseText});
      }
    };
    xhr.open("GET", `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=8060e3a8d1e26a20a92dcea9baf95422`, true);
    xhr.send();
  }

  render() {

    const main = this.state.weather !== null ? this.state.weather.weather.main : 'atom shut up';
    const temp = this.state.weather !== null ? this.state.weather.main.temp : 'atom shut up';
    return (
      <div>
        {main}
        {temp}
        {"hello?"}
      </div>

      );
  }

}


export default Weather;
