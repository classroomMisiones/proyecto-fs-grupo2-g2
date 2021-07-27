import { Component, OnInit } from '@angular/core';
import {FormControl, FormGroup } from '@angular/forms';
import Aos from 'aos';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  createFormGroup() {
    return new FormGroup ({
      email: new FormControl(''),
      password: new FormControl(''),
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

  clickBtnLogin() {
    if (this.formulariologin.valid) {
      console.log('control validez credenciales');
  }
  }

}
