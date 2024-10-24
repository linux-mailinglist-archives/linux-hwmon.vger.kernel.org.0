Return-Path: <linux-hwmon+bounces-4558-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E65B89AE48D
	for <lists+linux-hwmon@lfdr.de>; Thu, 24 Oct 2024 14:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6D93283410
	for <lists+linux-hwmon@lfdr.de>; Thu, 24 Oct 2024 12:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7EA1D5161;
	Thu, 24 Oct 2024 12:13:17 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD11F1D63EC
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Oct 2024 12:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729771997; cv=none; b=SKLKtgWabjBDwrByhO2jJ4wci12m2AcasUCVllfn0omq/8rAWIBnUavFVBp3Y/BfWHo8PBj8r5h2DsM8D6rLdJ5N7IsPcKkQNMqn1924DrweOu5U5ZEAqIcWpzXHpjvxQkJUu5mQPhdfcyU7dVheHF4FWLpIXMaH5hCqxdCXG5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729771997; c=relaxed/simple;
	bh=757xfs4lzj57ukyiAsyKVVfqB5Ggr6DUtawVPHyIcbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zo5rYYH6whxwSRHcdrr9pWmJEFETYTs+VcyGFGJpo85vuskdfQVL7ye6uN7OfkO1y1ZvlUcu842aRi7Xt9Wv/+nQ3q0tTV4IEL/wJQUxNLGrN2Hv0NqYgByOreoH8HEtOJDSQWYFlWlrRzaT3FQasgcIld0TummXLxZvFEzzs0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1t3whs-0006NN-0Q; Thu, 24 Oct 2024 14:12:48 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1t3whp-000CBK-1a;
	Thu, 24 Oct 2024 14:12:45 +0200
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 043E635DB21;
	Thu, 24 Oct 2024 12:12:45 +0000 (UTC)
Date: Thu, 24 Oct 2024 14:12:44 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 4/9] can: Add Nuvoton NCT6694 CAN support
Message-ID: <20241024-majestic-chowchow-from-wonderland-096eb4-mkl@pengutronix.de>
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
 <20241024085922.133071-5-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6cwye7pcrjvlm26t"
Content-Disposition: inline
In-Reply-To: <20241024085922.133071-5-tmyu0@nuvoton.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org


--6cwye7pcrjvlm26t
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 4/9] can: Add Nuvoton NCT6694 CAN support
MIME-Version: 1.0

Hello,

thanks for your contribution. It seems to me that there is no proper
TX-flow control and I have some questions.

On 24.10.2024 16:59:17, Ming Yu wrote:

[...]

> +static netdev_tx_t nct6694_canfd_start_xmit(struct sk_buff *skb,
> +					    struct net_device *ndev)
> +{
> +	struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> +	struct nct6694 *nct6694 =3D priv->nct6694;
> +	struct canfd_frame *cf =3D (struct canfd_frame *)skb->data;
> +	struct net_device_stats *stats =3D &ndev->stats;
> +	int can_idx =3D priv->can_idx;
> +	u32 txid =3D 0;
> +	int i;
> +	unsigned int echo_byte;
> +	u8 data_buf[REQUEST_CAN_CMD10_LEN] =3D {0};
> +
> +	if (can_dropped_invalid_skb(ndev, skb))
> +		return NETDEV_TX_OK;
> +
> +	/*
> +	 * No check for NCT66794 because the TX bit is read-clear
> +	 * and may be read-cleared by other function
> +	 * Just check the result of tx command.
> +	 */

Where do you check the result of the TX command?

> +	/* Check if the TX buffer is full */

Where's the check if the TX buffer is full?

> +	netif_stop_queue(ndev);
> +
> +	if (can_idx =3D=3D 0)
> +		data_buf[CAN_TAG_IDX] =3D CAN_TAG_CAN0;
> +	else
> +		data_buf[CAN_TAG_IDX] =3D CAN_TAG_CAN1;
> +
> +	if (cf->can_id & CAN_EFF_FLAG) {
> +		txid =3D cf->can_id & CAN_EFF_MASK;
> +		/*
> +		 * In case the Extended ID frame is transmitted, the
> +		 * standard and extended part of the ID are swapped
> +		 * in the register, so swap them back to send the
> +		 * correct ID.
> +		 */
> +		data_buf[CAN_FLAG_IDX] |=3D CAN_FLAG_EFF;
> +	} else {
> +		txid =3D cf->can_id & CAN_SFF_MASK;
> +	}
> +
> +	set_buf32(&data_buf[CAN_ID_IDX], txid);
> +
> +	data_buf[CAN_DLC_IDX] =3D cf->len;
> +
> +	if ((priv->can.ctrlmode & CAN_CTRLMODE_FD) && can_is_canfd_skb(skb)) {
> +		data_buf[CAN_FLAG_IDX] |=3D CAN_FLAG_FD;
> +		if (cf->flags & CANFD_BRS)
> +			data_buf[CAN_FLAG_IDX] |=3D CAN_FLAG_BRS;
> +	}
> +
> +	if (cf->can_id & CAN_RTR_FLAG)
> +		data_buf[CAN_FLAG_IDX] |=3D CAN_FLAG_RTR;
> +
> +	/* set data to buf */
> +	for (i =3D 0; i < cf->len; i++)
> +		data_buf[CAN_DATA_IDX + i] =3D *(u8 *)(cf->data + i);
> +
> +	can_put_echo_skb(skb, ndev, 0, 0);
> +
> +	memcpy(priv->data_buf, data_buf, REQUEST_CAN_CMD10_LEN);
> +	queue_work(nct6694->async_workqueue, &priv->tx_work);
> +
> +	stats->tx_bytes +=3D cf->len;
> +	stats->tx_packets++;
> +	echo_byte =3D can_get_echo_skb(ndev, 0, NULL);
> +
> +	netif_wake_queue(ndev);

How do you make sure that the tx_work has finished?
Once you wake the queue, the xmit function can be called again. If your
tx_work has not finished, you'll overwrite the priv->data_buf.

> +
> +	return NETDEV_TX_OK;
> +}
> +
> +static void nct6694_canfd_tx_work(struct work_struct *work)
> +{
> +	struct nct6694_canfd_priv *priv;
> +
> +	priv =3D container_of(work, struct nct6694_canfd_priv, tx_work);
> +
> +	nct6694_write_msg(priv->nct6694, REQUEST_CAN_MOD,
> +			  REQUEST_CAN_CMD10_OFFSET(1),
> +			  REQUEST_CAN_CMD10_LEN,
> +			  priv->data_buf);
> +}

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--6cwye7pcrjvlm26t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmcaObkACgkQKDiiPnot
vG+LQAgAhoMTmPVPW2b961itbbB9oiqWyTkhSh4BodeXFxnDPmkZXIOwf2jfKTkg
U1rUoJ3PrsRcFjX7xP11xXV0jtNa/CKHpinjDL1P1ftYZEL3Sb3fGAEzT5tWA8ui
d2AgBRmaEPXfJ4ru5nURHrt8t8XvQw2aVBMVWXQeOkYCGzjXKr1Zc1QMawCRzdCY
FYppixW1eYbUkR4GC13th38n1p5eM5+AgUJqMipnj1ufTesWAiY1eAw3KFq+h8AW
uiOqN5+4uRstPyaNzS/e0r8bfKk8s/KxNny0b14ACrO6aBWp9we9wSvC/SLxPJE7
BgbbQ1zBu5RQVdURF4mPlfvt9z9NKA==
=amjj
-----END PGP SIGNATURE-----

--6cwye7pcrjvlm26t--

