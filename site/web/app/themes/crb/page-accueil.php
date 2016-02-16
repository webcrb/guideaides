<?php
/**
 * Template Name: Page d'accueil
 */
?>
<div class="wrapper" ng-controller="searchController as main">
<header class="mainheader">

	<div class="container">

		<?php while (have_posts()) : the_post(); ?>
		<div class="text">
		  <?php //get_template_part('templates/page', 'header'); ?>
		  <h1 class="display-2"><i class="icon-logo_fr"></i><br><?php bloginfo('name'); ?> <small class="sr-only">Région Bretagne</small></h1>
		  <?php get_template_part('templates/content', 'page'); ?>
		 </div>
		<?php endwhile; ?>
	


		<form class="searchform">

			<div class="form-group">
			    
			    <label class="sr-only" for="exampleInputEmail1">Recherche</label>

				<angucomplete-alt id="term"
	              placeholder="Entrez votre recherche"
	              pause="200"
	              minlength="2"
	              selected-object="term"
	              local-data="main.etiquettes.data"
	              search-fields="name"
          		  title-field="name"
	              description-field="description"
	              input-class="form-control form-control-lg" />

			</div>

		</form>
	</div>

</header>

<section class="section results">

	<div class="container">

		<div class="row">

			<div class="col-md-4 col-md-push-8">

				<h2>Filtres</h2>
				
				<form class="filters" id="filters" >
					<div class="form-group" data-group="profils">
						<!-- <div class="checkbox">
							<label>
							  <input type="checkbox" value="*" checked> Tous les profils
							</label>
						</div> -->
						<div class="checkbox" ng-repeat="profil in main.profils.data" >
							<label>
							  <input type="checkbox" name="selectedProfils[]" value="{{ profil.id }}" ng-model="profil.checked" > <span ng-bind-html="profil.name"></span>
							</label>
						</div>
					</div>
					<hr>
					<div class="form-group" data-group="thematiques">
						<!-- <div class="checkbox">
							<label>
							  <input type="checkbox" value="*" checked> Toutes les thématiques
							</label>
						</div> -->
						<div class="checkbox" ng-repeat="thematique in main.thematiques.data">
							<label>
							  <input type="checkbox" value=".{{ thematique.slug }}"> <span ng-bind-html="thematique.name"></span>
							</label>
						</div>
					</div>
				</form>
				
			</div> <!-- col -->

			<div class="col-md-8 col-md-pull-4">

				{{main.profil}}

				<ul id="" class="list-unstyled list-results">
					<li ng-repeat="aide in main.aides.data | filter:{ tags: term.originalObject.id, profil: profil}" class="list-item" ng-class="[main.getClass(aide.acf.profil), main.getClass(aide.acf.thematiques)]">
						<article class="list-item-wrap aide-excerpt">
							<header class="aide-header">
								<ul class="nav nav-inline pull-right">
									<li ng-repeat="aidethematique in aide.acf.thematiques" class="nav-item"><small class="text-muted" ng-bind-html="aidethematique.name"></small></li>
								</ul>
								<h2 class="aide-title" ng-bind-html="aide.title.rendered"></h2>
								<ul class="nav nav-inline">
									<li ng-repeat="aideprofil in aide.acf.profil" class="nav-item"><span class="label label-default" ng-bind-html="aideprofil.name"></span></li>
								</ul>
							</header>
							<p ng-bind-html="aide.excerpt.rendered"></p>
							
							<footer>
							</footer>
							<p class="text-md-right"><a ng-href="{{ aide.link }}">consulter &#8594; </a></p>
						</article>
					</li>
				</ul>
				
			</div> <!-- col -->
		</div> <!-- row -->

	</div><!-- container -->
	

</section>
</div>