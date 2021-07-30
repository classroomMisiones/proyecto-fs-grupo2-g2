import { Component, OnInit } from '@angular/core';
import {FormControl, FormGroup, Validators } from '@angular/forms';
import Aos from 'aos';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  emailPattern: any = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

  createFormGroup() {
    return new FormGroup ({
      email: new FormControl('',[Validators.required, Validators.pattern(this.emailPattern)]),
      password: new FormControl('',[Validators.required]),
      recuerdame: new FormControl(true)
    });
  }

  formulariologin :FormGroup;

  constructor() {
    this.formulariologin = this.createFormGroup();
   }

  ngOnInit(): void {
    Aos.init();
  }
  get email(){
    return this.formulariologin.get('email')
  }
  get password(){
    return this.formulariologin.get('password')
  }
  get recuerdame(){
    return this.formulariologin.get('recuerdame')
  }

  onLogin() {
    if (this.formulariologin.valid) {
      console.log('control validez credenciales');
  }
  }

}
