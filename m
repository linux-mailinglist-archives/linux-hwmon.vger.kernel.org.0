Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 525A154A08B
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Jun 2022 22:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343522AbiFMU4j (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 13 Jun 2022 16:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351369AbiFMUzQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Jun 2022 16:55:16 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1336F2DEB
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Jun 2022 13:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1655152075;
  x=1686688075;
  h=date:to:cc:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to:from;
  bh=W8Vli6V0YaPpcnxAfXgk1UR+rUnDxRaPikomO6VxFrw=;
  b=Wrt7KOW4n6jwOt2pFwuF9jPamVBi7CLZci0TUTKNtDCEYMqNb9YwrRr9
   b88QUpc/27soSIVoE1GSCAtobOpQYtQYRk0SgEvHLPHikdTuABY0yfmkp
   IxlXrPwlX3fQfMJWjpTbSH5wU/llHgSPbqspwPwyDl6oXjiFJNoIs23EP
   KnFFvVGTXvdaYX6vBpF7zOrq40qJD1D0FJmQnFjuDzB5SsNe8/8swAw2L
   q1xvP0iTSut9OxxoeG+xijO0LHf97O2nEoGTmiyaeVkn4AkI4bmHHelIz
   p0uhzlYom1wTIgC4iSZU1R1OZIqtRzepdnJ+Hy58K2J2ozkUts7/BkFMG
   A==;
Date:   Mon, 13 Jun 2022 22:27:52 +0200
To:     Guenter Roeck <linux@roeck-us.net>
CC:     =?iso-8859-1?Q?M=E5rten?= Lindahl <Marten.Lindahl@axis.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        kernel <kernel@axis.com>
Subject: Re: [PATCH v2 2/3] hwmon: (pmbus) Add list_voltage to pmbus ops
Message-ID: <YqedyHS+O+1Dc5ZZ@axis.com>
References: <20220610114732.2370242-1-marten.lindahl@axis.com>
 <20220610114732.2370242-3-marten.lindahl@axis.com>
 <a9c983f9-9aa8-caa2-b970-46fd2ae1c96f@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9c983f9-9aa8-caa2-b970-46fd2ae1c96f@roeck-us.net>
From:   Marten Lindahl <martenli@axis.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jun 10, 2022 at 04:16:46PM +0200, Guenter Roeck wrote:
> On 6/10/22 04:47, M�rten Lindahl wrote:
> > When checking if a regulator supports a voltage range, the regulator
> > needs to have a list_voltage callback set to the regulator_ops or else
> > -EINVAL will be returned. This support does not exist for the pmbus
> > regulators, so this patch adds pmbus_regulator_list_voltage to the
> > pmbus_regulator_ops.
> > 
> > Signed-off-by: M�rten Lindahl <marten.lindahl@axis.com>
> > ---
> >   drivers/hwmon/pmbus/pmbus_core.c | 50 ++++++++++++++++++++++++++++++++
> >   1 file changed, 50 insertions(+)
> > 
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> > index 478dda49a45f..24ba4b2b03d4 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -2711,6 +2711,55 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
> >   	return _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
> >   }
> >   
> > +static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,
> > +					 unsigned int selector)
> > +{
> > +	struct device *dev = rdev_get_dev(rdev);
> > +	struct i2c_client *client = to_i2c_client(dev->parent);
> > +	struct pmbus_data *data = i2c_get_clientdata(client);
> > +	struct pmbus_sensor s = {
> > +		.page = rdev_get_id(rdev),
> > +		.class = PSC_VOLTAGE_OUT,
> > +		.convert = true,
> > +		.data = -1,
> > +	};
> > +	int val = DIV_ROUND_CLOSEST(rdev->desc->min_uV +
> > +				    (rdev->desc->uV_step * selector),
> > +				    1000); /* convert to mV */
> > +
> > +	if (!data->vout_low[s.page]) {
> > +		if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MIN))
> > +			s.data = _pmbus_read_word_data(client, s.page, 0xff,
> > +						       PMBUS_MFR_VOUT_MIN);
> > +		if (s.data < 0) {
> > +			s.data = _pmbus_read_word_data(client, s.page, 0xff,
> > +						       PMBUS_VOUT_MARGIN_LOW);
> > +			if (s.data < 0)
> > +				return s.data;
> > +		}
> > +		data->vout_low[s.page] = pmbus_reg2data(data, &s);
> > +	}
> > +
> > +	if (!data->vout_high[s.page]) {
> > +		s.data = -1;
> > +		if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MAX))
> > +			s.data = _pmbus_read_word_data(client, s.page, 0xff,
> > +						       PMBUS_MFR_VOUT_MAX);
> > +		if (s.data < 0) {
> > +			s.data = _pmbus_read_word_data(client, s.page, 0xff,
> > +						       PMBUS_VOUT_MARGIN_HIGH);
> > +			if (s.data < 0)
> > +				return s.data;
> > +		}
> > +		data->vout_high[s.page] = pmbus_reg2data(data, &s);
> > +	}
> > +

Hi Guenter!
> 
> The code above is similar to the same code in the first patch. Please
> move it into a function (in the first patch).

Ok, I will do that. I think it will be one function for low_margin and
one for high_margin.

> 
> > +	if (val >= data->vout_low[s.page] && val <= data->vout_high[s.page])
> > +		return val * 1000; /* unit is uV */
> > +
> > +	return 0;
> 
> Other drivers return -EINVAL here. Should this be returned as well
> if rdev->desc->min_uV or rdev->desc->uV_step is 0, if selector
> is out of range, or if data->vout_low[s.page] / data->vout_high[s.page]
> is 0 ?

I will add some more checks. I will try to follow what the description
of list_voltages says in include/linux/regulator/driver.h, but it's a
bit free for interpretation, thinking of what counts as unusable
voltages :)

* @list_voltage: Return one of the supported voltages, in microvolts; zero
*	if the selector indicates a voltage that is unusable on this system;
*	or negative errno.  Selectors range from zero to one less than
*	regulator_desc.n_voltages.  Voltages may be reported in any order.

I guess, as long as a voltage is inside of the low/high margins it is a
valid voltage (even though high and/or low is 0).

Kind regards
M�rten

> 
> Thanks,
> Guenter
> 
> > +}
> > +
> >   const struct regulator_ops pmbus_regulator_ops = {
> >   	.enable = pmbus_regulator_enable,
> >   	.disable = pmbus_regulator_disable,
> > @@ -2718,6 +2767,7 @@ const struct regulator_ops pmbus_regulator_ops = {
> >   	.get_error_flags = pmbus_regulator_get_error_flags,
> >   	.get_voltage = pmbus_regulator_get_voltage,
> >   	.set_voltage = pmbus_regulator_set_voltage,
> > +	.list_voltage = pmbus_regulator_list_voltage,
> >   };
> >   EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
> >   
> 
