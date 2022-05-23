Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 564BA530FC7
	for <lists+linux-hwmon@lfdr.de>; Mon, 23 May 2022 15:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234457AbiEWLFe (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 23 May 2022 07:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234264AbiEWLFb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 May 2022 07:05:31 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C26D17E33;
        Mon, 23 May 2022 04:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1653303929; x=1684839929;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ecSMPA6CEeNkEL0oD+cFhQMJsVmMfYhT1VOqZf+Zi4E=;
  b=lJiYDdPVUAxNYw9ujngzctfo6RzSaLbq1496/Kw9yntWey2q0Ewjmh5a
   29FKGsfxmJEm8N8DpDIq7f4LvPyfNYU4OcXEvILViHZhL9IyuG5x3X9lF
   vl5EOC4UrUkvqNxHFg87ModYILBtfW8dDcyMnnVur1PVMGbOtblnXaHbH
   zHIHmXB5V/bCM3ONVZDlu4I56GQ/rJtpO0dbxtt1bpBy3nAdcjZ2xuirh
   RICxOHze7kvsPZ57nuDeAjre5tnhBnJwIETpyjCduQJdkFPhKDm+PEnKq
   n5Ke2dWAy9tG38TY1I2X3GCOf8+AZNueahx6YyH/8pMU5Jj4zpZv+UDf/
   A==;
X-IronPort-AV: E=Sophos;i="5.91,246,1647298800"; 
   d="scan'208";a="24031376"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 May 2022 13:05:19 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 23 May 2022 13:05:19 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 23 May 2022 13:05:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1653303919; x=1684839919;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ecSMPA6CEeNkEL0oD+cFhQMJsVmMfYhT1VOqZf+Zi4E=;
  b=P7sDnV8IxY8+RCQZrWLt6mrTj39OBojiejncGHAxccf34y/0EtQHIlWT
   nNjKTGEUTHiJjFD92tR41AWbg7crwKu2xteFvrpjbUoJnjTV8L9bpYNnx
   qi6h9Q7UOiz48zDEan9G6LT5MK1Zol/e1MvQDXwvRiZODAqwtRwz1oXkX
   atCc2eORHmuphbrK/r6jeICLJacVYin0yBXv0otYQTNb9+9MiucWWLIVj
   7PfeoX12WaeeURxLmYrZwbt+8D5INB3N4fNmQr/3j75f1FmfdFaLkb7HH
   GG3UrVjaumBGz5CvKXNOKgxAgKi05Ds1h0Rx57LsSiOIIejJczy/7ioUe
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,246,1647298800"; 
   d="scan'208";a="24031375"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 May 2022 13:05:19 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 09F3E280078;
        Mon, 23 May 2022 13:05:19 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org,
        Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject: [PATCH v4 5/6] hwmon: pwm-fan: Switch regulator dynamically
Date:   Mon, 23 May 2022 13:05:12 +0200
Message-Id: <20220523110513.407516-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523110513.407516-1-alexander.stein@ew.tq-group.com>
References: <20220523110513.407516-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_CSS_A autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This adds the enable attribute which is used to select if zero PWM duty
means to switch off regulator and PWM or to keep them enabled but
at inactive PWM output level.
Depending on the select enable mode, turn off the regulator and PWM if
the PWM duty is zero, or keep them enabled.
This is especially important for fan using inverted PWM signal polarity.
Having regulator supplied and PWM disabled, some PWM controllers provide
the active, rather than inactive signal.

With this change the shutdown as well as suspend/resume paths require
modifcations as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/hwmon/pwm-fan.rst |  12 ++
 drivers/hwmon/pwm-fan.c         | 213 +++++++++++++++++++++-----------
 2 files changed, 154 insertions(+), 71 deletions(-)

diff --git a/Documentation/hwmon/pwm-fan.rst b/Documentation/hwmon/pwm-fan.rst
index 82fe96742fee..f77998b204ef 100644
--- a/Documentation/hwmon/pwm-fan.rst
+++ b/Documentation/hwmon/pwm-fan.rst
@@ -18,3 +18,15 @@ the hwmon's sysfs interface.
 
 The fan rotation speed returned via the optional 'fan1_input' is extrapolated
 from the sampled interrupts from the tachometer signal within 1 second.
+
+The driver provides the following sensor accesses in sysfs:
+
+=============== ======= =======================================================
+fan1_input	ro	fan tachometer speed in RPM
+pwm1_enable	rw	keep enable mode, defines behaviour when pwm1=0
+			0 -> disable pwm and regulator
+			1 -> enable pwm; if pwm==0, disable pwm, keep regulator enabled
+			2 -> enable pwm; if pwm==0, keep pwm and regulator enabled
+			3 -> enable pwm; if pwm==0, disable pwm and regulator
+pwm1		rw	relative speed (0-255), 255=max. speed.
+=============== ======= =======================================================
diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index fcc1b7b55a65..e5d4b3b1cc49 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -28,6 +28,13 @@ struct pwm_fan_tach {
 	u8 pulses_per_revolution;
 };
 
+enum pwm_fan_enable_mode {
+	pwm_off_reg_off,
+	pwm_disable_reg_enable,
+	pwm_enable_reg_enable,
+	pwm_disable_reg_disable,
+};
+
 struct pwm_fan_ctx {
 	struct device *dev;
 
@@ -35,6 +42,7 @@ struct pwm_fan_ctx {
 	struct pwm_device *pwm;
 	struct pwm_state pwm_state;
 	struct regulator *reg_en;
+	enum pwm_fan_enable_mode enable_mode;
 	bool regulator_enabled;
 	bool enabled;
 
@@ -86,6 +94,29 @@ static void sample_timer(struct timer_list *t)
 	mod_timer(&ctx->rpm_timer, jiffies + HZ);
 }
 
+static void pwm_fan_enable_mode_2_state(int enable_mode,
+					struct pwm_state *state,
+					bool *enable_regulator)
+{
+	switch (enable_mode) {
+	case pwm_disable_reg_enable:
+		/* disable pwm, keep regulator enabled */
+		state->enabled = false;
+		*enable_regulator = true;
+		break;
+	case pwm_enable_reg_enable:
+		/* keep pwm and regulator enabled */
+		state->enabled = true;
+		*enable_regulator = true;
+		break;
+	case pwm_off_reg_off:
+	case pwm_disable_reg_disable:
+		/* disable pwm and regulator */
+		state->enabled = false;
+		*enable_regulator = false;
+	}
+}
+
 static int pwm_fan_switch_power(struct pwm_fan_ctx *ctx, bool on)
 {
 	int ret = 0;
@@ -117,30 +148,46 @@ static int pwm_fan_power_on(struct pwm_fan_ctx *ctx)
 	if (ctx->enabled)
 		return 0;
 
+	ret = pwm_fan_switch_power(ctx, true);
+	if (ret < 0) {
+		dev_err(ctx->dev, "failed to enable power supply\n");
+		return ret;
+	}
+
 	state->enabled = true;
 	ret = pwm_apply_state(ctx->pwm, state);
 	if (ret) {
 		dev_err(ctx->dev, "failed to enable PWM\n");
-		goto err;
+		goto disable_regulator;
 	}
 
 	ctx->enabled = true;
 
-err:
+	return 0;
+
+disable_regulator:
+	pwm_fan_switch_power(ctx, false);
 	return ret;
 }
 
 static int pwm_fan_power_off(struct pwm_fan_ctx *ctx)
 {
 	struct pwm_state *state = &ctx->pwm_state;
+	bool enable_regulator = false;
 
 	if (!ctx->enabled)
 		return 0;
 
+	pwm_fan_enable_mode_2_state(ctx->enable_mode,
+				    state,
+				    &enable_regulator);
+
 	state->enabled = false;
 	state->duty_cycle = 0;
 	pwm_apply_state(ctx->pwm, state);
 
+	pwm_fan_switch_power(ctx, enable_regulator);
+
 	ctx->enabled = false;
 
 	return 0;
@@ -153,6 +200,10 @@ static int  __set_pwm(struct pwm_fan_ctx *ctx, unsigned long pwm)
 	int ret = 0;
 
 	if (pwm > 0) {
+		if (ctx->enable_mode == pwm_off_reg_off)
+			/* pwm-fan hard disabled */
+			return 0;
+
 		period = state->period;
 		state->duty_cycle = DIV_ROUND_UP(pwm * (period - 1), MAX_PWM);
 		ret = pwm_apply_state(ctx->pwm, state);
@@ -190,20 +241,76 @@ static void pwm_fan_update_state(struct pwm_fan_ctx *ctx, unsigned long pwm)
 	ctx->pwm_fan_state = i;
 }
 
+static int pwm_fan_update_enable(struct pwm_fan_ctx *ctx, long val)
+{
+	int ret = 0;
+	int old_val;
+
+	mutex_lock(&ctx->lock);
+
+	if (ctx->enable_mode == val)
+		goto out;
+
+	old_val = ctx->enable_mode;
+	ctx->enable_mode = val;
+
+	if (val == 0) {
+		/* Disable pwm-fan unconditionally */
+		ret = __set_pwm(ctx, 0);
+		if (ret)
+			ctx->enable_mode = old_val;
+		pwm_fan_update_state(ctx, 0);
+	} else {
+		/*
+		 * Change PWM and/or regulator state if currently disabled
+		 * Nothing to do if currently enabled
+		 */
+		if (!ctx->enabled) {
+			struct pwm_state *state = &ctx->pwm_state;
+			bool enable_regulator = false;
+
+			state->duty_cycle = 0;
+			pwm_fan_enable_mode_2_state(val,
+						    state,
+						    &enable_regulator);
+
+			pwm_apply_state(ctx->pwm, state);
+			pwm_fan_switch_power(ctx, enable_regulator);
+			pwm_fan_update_state(ctx, 0);
+		}
+	}
+out:
+	mutex_unlock(&ctx->lock);
+
+	return ret;
+}
+
 static int pwm_fan_write(struct device *dev, enum hwmon_sensor_types type,
 			 u32 attr, int channel, long val)
 {
 	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
 	int ret;
 
-	if (val < 0 || val > MAX_PWM)
-		return -EINVAL;
+	switch (attr) {
+	case hwmon_pwm_input:
+		if (val < 0 || val > MAX_PWM)
+			return -EINVAL;
+		ret = set_pwm(ctx, val);
+		if (ret)
+			return ret;
+		pwm_fan_update_state(ctx, val);
+		break;
+	case hwmon_pwm_enable:
+		if (val < 0 || val > 3)
+			ret = -EINVAL;
+		else
+			ret = pwm_fan_update_enable(ctx, val);
 
-	ret = set_pwm(ctx, val);
-	if (ret)
 		return ret;
+	default:
+		return -EOPNOTSUPP;
+	}
 
-	pwm_fan_update_state(ctx, val);
 	return 0;
 }
 
@@ -214,9 +321,15 @@ static int pwm_fan_read(struct device *dev, enum hwmon_sensor_types type,
 
 	switch (type) {
 	case hwmon_pwm:
-		*val = ctx->pwm_value;
-		return 0;
-
+		switch (attr) {
+		case hwmon_pwm_input:
+			*val = ctx->pwm_value;
+			return 0;
+		case hwmon_pwm_enable:
+			*val = ctx->enable_mode;
+			return 0;
+		}
+		return -EOPNOTSUPP;
 	case hwmon_fan:
 		*val = ctx->tachs[channel].rpm;
 		return 0;
@@ -345,20 +458,14 @@ static int pwm_fan_of_get_cooling_data(struct device *dev,
 	return 0;
 }
 
-static void pwm_fan_regulator_disable(void *data)
-{
-	struct pwm_fan_ctx *ctx = data;
-
-	pwm_fan_switch_power(ctx, false);
-}
-
-static void pwm_fan_pwm_disable(void *__ctx)
+static void pwm_fan_cleanup(void *__ctx)
 {
 	struct pwm_fan_ctx *ctx = __ctx;
 
-	ctx->pwm_state.enabled = false;
-	pwm_apply_state(ctx->pwm, &ctx->pwm_state);
 	del_timer_sync(&ctx->rpm_timer);
+	/* Switch off everything */
+	ctx->enable_mode = pwm_disable_reg_disable;
+	pwm_fan_power_off(ctx);
 }
 
 static int pwm_fan_probe(struct platform_device *pdev)
@@ -392,16 +499,6 @@ static int pwm_fan_probe(struct platform_device *pdev)
 			return PTR_ERR(ctx->reg_en);
 
 		ctx->reg_en = NULL;
-	} else {
-		ret = pwm_fan_switch_power(ctx, true);
-		if (ret) {
-			dev_err(dev, "Failed to enable fan supply: %d\n", ret);
-			return ret;
-		}
-		ret = devm_add_action_or_reset(dev, pwm_fan_regulator_disable,
-					       ctx);
-		if (ret)
-			return ret;
 	}
 
 	pwm_init_state(ctx->pwm, &ctx->pwm_state);
@@ -416,14 +513,19 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	/* Set duty cycle to maximum allowed and enable PWM output */
+	ctx->enable_mode = pwm_disable_reg_enable;
+
+	/*
+	 * Set duty cycle to maximum allowed and enable PWM output as well as
+	 * the regulator. In case of error nothing is changed
+	 */
 	ret = set_pwm(ctx, MAX_PWM);
 	if (ret) {
 		dev_err(dev, "Failed to configure PWM: %d\n", ret);
 		return ret;
 	}
 	timer_setup(&ctx->rpm_timer, sample_timer, 0);
-	ret = devm_add_action_or_reset(dev, pwm_fan_pwm_disable, ctx);
+	ret = devm_add_action_or_reset(dev, pwm_fan_cleanup, ctx);
 	if (ret)
 		return ret;
 
@@ -455,7 +557,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	if (!channels)
 		return -ENOMEM;
 
-	channels[0] = HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT);
+	channels[0] = HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE);
 
 	for (i = 0; i < ctx->tach_count; i++) {
 		struct pwm_fan_tach *tach = &ctx->tachs[i];
@@ -529,57 +631,26 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int pwm_fan_disable(struct device *dev)
-{
-	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
-	int ret;
-
-	if (ctx->pwm_value) {
-		/* keep ctx->pwm_state unmodified for pwm_fan_resume() */
-		struct pwm_state state = ctx->pwm_state;
-
-		state.duty_cycle = 0;
-		state.enabled = false;
-		ret = pwm_apply_state(ctx->pwm, &state);
-		if (ret < 0)
-			return ret;
-	}
-
-	ret = pwm_fan_switch_power(ctx, false);
-	if (ret) {
-		dev_err(dev, "Failed to disable fan supply: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
 static void pwm_fan_shutdown(struct platform_device *pdev)
 {
-	pwm_fan_disable(&pdev->dev);
+	struct pwm_fan_ctx *ctx = platform_get_drvdata(pdev);
+
+	pwm_fan_cleanup(ctx);
 }
 
 #ifdef CONFIG_PM_SLEEP
 static int pwm_fan_suspend(struct device *dev)
 {
-	return pwm_fan_disable(dev);
+	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
+
+	return pwm_fan_power_off(ctx);
 }
 
 static int pwm_fan_resume(struct device *dev)
 {
 	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
-	int ret;
-
-	ret = pwm_fan_switch_power(ctx, true);
-	if (ret) {
-		dev_err(dev, "Failed to enable fan supply: %d\n", ret);
-		return ret;
-	}
-
-	if (ctx->pwm_value == 0)
-		return 0;
 
-	return pwm_apply_state(ctx->pwm, &ctx->pwm_state);
+	return set_pwm(ctx, ctx->pwm_value);
 }
 #endif
 
-- 
2.25.1

