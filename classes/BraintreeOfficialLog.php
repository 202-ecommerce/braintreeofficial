<?php
/**
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
 *  @author 202-ecommerce <tech@202-ecommerce.com>
 *  @copyright Copyright (c) 202-ecommerce
 *  @license http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 */

namespace BraintreeOfficialAddons\classes;

use BraintreeofficialPPBTlib\Extensions\ProcessLogger\Classes\ProcessLoggerObjectModel;
use BraintreeOfficialAddons\services\ServiceBraintreeOfficialLog;

/**
 * Class BraintreeOfficialLog.
 */
class BraintreeOfficialLog extends ProcessLoggerObjectModel
{
    /* @var ServiceBraintreeOfficialLog object service*/
    protected $serviceLog;

    public function __construct($id = null, $id_lang = null, $id_shop = null)
    {
        parent::__construct($id, $id_lang, $id_shop);
        $this->setServiceLog(new ServiceBraintreeOfficialLog());
    }

    public function setServiceLog($service)
    {
        $this->serviceLog = $service;
    }

    public function getLinkToTransaction()
    {
        return $this->serviceLog->getLinkToTransaction($this);
    }

    public function getDateTransaction()
    {
        if ($this->date_transaction == '0000-00-00 00:00:00') {
            return '';
        }

        $dateTimeZone = new \DateTimeZone('GMT');
        $date = new \DateTime($this->date_transaction, $dateTimeZone);
        return $date->format('Y-m-d H:i:s T');
    }
}
