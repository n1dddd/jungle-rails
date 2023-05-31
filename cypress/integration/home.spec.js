describe('Visits homepage', () => {

    it('test if cypress connects to the homepage', () => {
        cy.visit('http://localhost:3000')
    })
    it('test if there is a product on the homepage', () => {
        cy.get(".products article").should("be.visible")
    });
});