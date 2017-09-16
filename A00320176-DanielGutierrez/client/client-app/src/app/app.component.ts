import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'app';

  list = [
    {
      title: '1asdfasdf'
    },
    {
      title: '1asdfaasdfasdfsdf'
    },
    {
      title: '12341234'
    },
    {
      title: 'asdfasdfasd'
    }

  ];

  ngInit() {
    alert('HELLO');
  }


}
