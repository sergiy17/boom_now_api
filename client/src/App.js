import React, { Component } from 'react';
import axios from 'axios';
import './App.css';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      city: '',
      adults: 2,
      listings: null,
      error: null,
      loading: false,
    };
  }

  handleInputChange = (event) => {
    const { name, value } = event.target;
    this.setState({ [name]: value });
  };

  handleSubmit = (event) => {
    event.preventDefault();
    const { city, adults } = this.state;
    this.setState({ listings: null, error: null, loading: true });

    let url = '/api/listings/search';
    const params = {};

    if (city) {
      params.city = city;
    }
    if (adults) {
      params.adults = adults;
    }

    if (Object.keys(params).length > 0) {
      url += '?' + new URLSearchParams(params).toString();
    }

    axios
        .get(url)
        .then((response) => {
          this.setState({ listings: response.data.result, error: null, loading: false }); //Set loading to false
        })
        .catch((error) => {
          if (error.response) {
            this.setState({ error: error.response.data.errors, listings: null, loading: false }); //Set loading to false
          } else {
            this.setState({ error: 'An unexpected error occurred.', listings: null, loading: false }); //Set loading to false
          }
        });
  };

  render() {
    const { city, adults, listings, error, loading } = this.state;

    return (
        <div className="App">
          <h1>Search Listings</h1>
          <form onSubmit={this.handleSubmit}>
            <label>
              City:
              <input
                  type="text"
                  name="city"
                  value={city}
                  onChange={this.handleInputChange}
              />
            </label>
            <label>
              Adults:
              <input
                  type="number"
                  name="adults"
                  value={adults}
                  onChange={this.handleInputChange}
              />
            </label>
            <button type="submit">Search</button>
          </form>

          {error && <div className="error">{error}</div>}

          <div style={{ display: 'flex' }}>
            <div style={{ width: '30%', textAlign: 'left', paddingRight: '20px' }}>
              <h2>Listings:</h2>
              {loading && <div>Loading...</div>} {/*Show loading message during request*/}
              {listings !== null && !loading && (listings && listings.length > 0 ? (
                  <pre style={{ whiteSpace: 'pre-wrap' }}>{JSON.stringify(listings, null, 2)}</pre>
              ) : (
                  listings !== null && !loading && <div>No listings found.</div>
              ))}
            </div>
            <div style={{ width: '70%' }}>
              {/* You can add more content here if needed */}
            </div>
          </div>
        </div>
    );
  }
}

export default App;