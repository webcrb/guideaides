<?php
/**
 * Template Name: Page d'accueil
 */
?>
<div class="container">

	<?php while (have_posts()) : the_post(); ?>
	  <?php get_template_part('templates/page', 'header'); ?>
	  <?php get_template_part('templates/content', 'page'); ?>
	<?php endwhile; ?>
	
	<div ng-controller="searchController as main">
		<div class="row">
			<div class="col-md-12">
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
			              input-class="form-control form-control-lg"/>

					</div>

				</form>
			</div>
			<!-- <div class="col-md-12 m-b-1">
				<div class="btn-group" opt-kind="" ok-key="filter">
					<button class="btn btn-primary-outline active" ok-sel="*">Tous</button>
					<button class="btn btn-primary-outline" ng-repeat="profil in main.profils.data" ok-sel=".{{ profil.slug }}" ng-bind-html="profil.name"></button>
				</div>
			</div> -->
			<div class="col-md-4 col-md-push-8">
				
				<form class="filters" id="filters" >
					<div class="form-group" data-group="profils">
<!-- 						<div class="checkbox">
							<label>
							  <input type="checkbox" value="*" checked> Tous les profils
							</label>
						</div> -->
						<div class="checkbox" ng-repeat="profil in main.profils.data">
							<label>
							  <input type="checkbox" value=".{{ profil.slug }}"> <span ng-bind-html="profil.name"></span>
							</label>
						</div>
					</div>
					<hr>
					<div class="form-group" data-group="thematiques">
<!-- 						<div class="checkbox">
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
				
			</div>

			<div class="col-md-8 col-md-pull-4">

				<ul id="isotopeContainer" class="list-unstyled list-results">
					<li ng-repeat="aide in main.aides.data | filter:{ tags: term.originalObject.id }" class="list-item" ng-class="[main.getClass(aide.acf.profil), main.getClass(aide.acf.thematiques)]">
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
				
			</div>
		</div>

	</div>
	
</div>