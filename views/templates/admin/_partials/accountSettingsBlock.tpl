{*
* 2007-2019 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author PrestaShop SA <contact@prestashop.com>
	* @copyright 2007-2019 PrestaShop SA
	* @license http://opensource.org/licenses/afl-3.0.php Academic Free License (AFL 3.0)
	* International Registered Trademark & Property of PrestaShop SA
	*}

<div>
	<p>
		{l s='Braintree Account' mod='braintree'}.
	</p>
	<p>
		{l s='In order to activate the module, you must connect your existing Braintree account or create a new one.' mod='braintree'}
	</p>
	<p>
		{if isset($accountConfigured) && $accountConfigured}
			<span class="btn btn-default" data-bt-logout>
				{l s='Logout' mod='braintree'}
			</span>
		{else}
			<span class="btn btn-default" data-toggle="modal" data-target="#credentialBlock">
				{l s='Connect or create Braintree account' mod='braintree'}
			</span>
		{/if}

		{if isset($showMigrationBtn) && $showMigrationBtn}
			<div>
				<a class="btn btn-default" href="{$link->getAdminLink('AdminBraintreeMigration', true)}">
					{l s='Migrate your settings from PayPal module' mod='braintree'}
				</a>
			</div>
		{/if}
	</p>
</div>
<div class="modal fade" id="credentialBlock" role="dialog" aria-labelledby="credentialBlock" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div>
					<div>
						<p class="h3">{l s='API Credentials' mod='braintree'}</p>
						<p>
							{l s='In order to accept Braintreee payments, please fill your API Keys.' mod='braintree'}
						</p>
						<p>
							{l s='If you do not have a Braintreee account, you can create by following this' mod='braintree'}
							<a href="">{l s='link' mod='braintree'}</a>
						</p>
						{include './formAccount.tpl'}
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">{l s='Cancel' mod='braintree'}</button>
				<button type="button" data-confirm-credentials class="btn btn-primary">{l s='Confirm API Credentials' mod='braintree'}</button>
			</div>
		</div>
	</div>
</div>