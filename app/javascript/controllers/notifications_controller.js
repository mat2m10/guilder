import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['list']

  connect(){
    setInterval(()=>{
      this.refresh()
    },5000)
  }

  refresh() {
    let date = new Date()
    date = new Date(date - 5000)
    const params = new URLSearchParams()
    params.append('created_after', date.getTime()/1000)
    const url = `/clients?${params.toString()}`
    fetch(url, { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        if (data.clients.length >= 1) this.handleNewClient(data.clients[0])
      });
  }

  handleNewClient(client) {
    alert("new client: " + client.username)
  }
}
