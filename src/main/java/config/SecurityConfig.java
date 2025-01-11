package config;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

	@EnableWebSecurity(debug=true)
	public class SecurityConfig extends WebSecurityConfigurerAdapter {
		//this class create the spring security filter chain for our app
		@Override
		protected void configure(AuthenticationManagerBuilder auth) throws Exception {
			auth.inMemoryAuthentication()
			.withUser("user")
				.password("{bcrypt}$2a$12$NGNBHolK/7YT7SHgZvIjT.JtYvOF6I0G750DcVjJbBzTx2TE2iS/S")
				.roles("USER")
			.and()
			.withUser("admin")
				.password("{noop}admin")
				.roles("USER", "ADMIN")
			.and()
			.withUser("inventory")
				.password("{noop}inventory")
				.roles("ADMIN")
				.and()
		        .withUser("student")
		            .password("{noop}student")
		            .roles("STUDENT") // Add STUDENT role
		        .and()
		        .withUser("teacher")
		            .password("{noop}teacher")
		            .roles("TEACHER"); // Add TEACHER role
			}
		
		@Autowired
		DataSource dataSource;
		
		@Override
		protected void configure(HttpSecurity http) throws Exception{
			http
			.authorizeRequests()
			.antMatchers("/public/**").permitAll()	
			.antMatchers("/usinghibernate/*").hasRole("ADMIN")
			.antMatchers("/product/*").hasRole("USER")
			.antMatchers("/home").hasRole("ADMIN")
			.antMatchers("/root").hasRole("ADMIN")
			.antMatchers("/admin/*").hasRole("ADMIN")
			.antMatchers("/student/*").hasRole("STUDENT") // Access restricted to STUDENT role
	        .antMatchers("/teacher/*").hasRole("TEACHER") // Access restricted to TEACHER role
			.antMatchers("/demoEL").hasAnyRole("ADMIN", "USER")
			.anyRequest().authenticated()
			.and()
			.formLogin().permitAll()
			.and()
			.logout().permitAll();
			
            http.csrf().disable();
		}
		
		protected void registerAuthentication(AuthenticationManagerBuilder authManagerBuilder) throws Exception {
	        PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();

	        authManagerBuilder
	            .inMemoryAuthentication()
	                .withUser("admin")
                    .password(encoder.encode("admin"))
                    .roles("ADMIN", "USER")
			        .and()
		            .withUser("user")
		                .password(encoder.encode("password"))
		                .roles("USER");
	    }
		}