import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HomeComponent } from './inicio/home/home.component';
import { QuienessomosComponent } from './inicio/quienessomos/quienessomos.component';
import { BilleteraComponent } from './inicio/billetera/billetera.component';
import { BeneficiosComponent } from './inicio/beneficios/beneficios.component';
import { ContactoComponent } from './inicio/contacto/contacto.component';
import { LoginComponent } from './inicio/login/login.component';




const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'home', component: HomeComponent },
  { path: 'nosotros', component: QuienessomosComponent},
  { path: 'billetera', component: BilleteraComponent},
  { path: 'beneficios', component: BeneficiosComponent},
  { path: 'contacto', component: ContactoComponent},
  { path: 'login', component: LoginComponent}


];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
